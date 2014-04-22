<?php
class ControllerAccountRegister extends Controller
{
    private $error = array();

    public function index()
    {



        if ($this->customer->isLogged()) {
            $this->redirect($this->url->link('account/account', '', 'SSL'));
        }

        $this->language->load('account/register');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('account/customer');

        // проверка на ajax валидацию
        if ($_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest'){
            if (!$this->validateAjax()){

                reset($this->error);

                $array = array(
                    "hasError" => true,
                    "message" => current($this->error)
                );

                echo json_encode($array);
                exit;

            }
            else{
                $this->model_account_customer->addCustomer($this->request->post);
                $this->customer->login($this->request->post['email'], $this->request->post['password']);

                $array = array(
                    "hasError" => false,
                    "message" => $this->url->link('account/success')
                );

                echo json_encode($array);
                exit;


            }
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            unset($this->session->data['guest']);

            $this->model_account_customer->addCustomer($this->request->post);

            $this->customer->login($this->request->post['email'], $this->request->post['password']);

            $this->redirect($this->url->link('account/success'));
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_account'),
            'href' => $this->url->link('account/account', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_register'),
            'href' => $this->url->link('account/register', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['text_select'] = $this->language->get('text_select');
        $this->data['text_account_already'] = sprintf($this->language->get('text_account_already'), $this->url->link('account/login', '', 'SSL'));
        $this->data['text_your_details'] = $this->language->get('text_your_details');
        $this->data['text_your_address'] = $this->language->get('text_your_address');
        $this->data['text_your_password'] = $this->language->get('text_your_password');
        $this->data['text_newsletter'] = $this->language->get('text_newsletter');

        $this->data['entry_firstname'] = $this->language->get('entry_firstname');
        $this->data['entry_lastname'] = $this->language->get('entry_lastname');
        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['entry_telephone'] = $this->language->get('entry_telephone');
        $this->data['entry_fax'] = $this->language->get('entry_fax');
        $this->data['entry_company'] = $this->language->get('entry_company');
        $this->data['entry_address_1'] = $this->language->get('entry_address_1');
        $this->data['entry_address_2'] = $this->language->get('entry_address_2');
        $this->data['entry_postcode'] = $this->language->get('entry_postcode');
        $this->data['entry_city'] = $this->language->get('entry_city');
        $this->data['entry_country'] = $this->language->get('entry_country');
        $this->data['entry_zone'] = $this->language->get('entry_zone');
        $this->data['entry_newsletter'] = $this->language->get('entry_newsletter');
        $this->data['entry_password'] = $this->language->get('entry_password');
        $this->data['entry_confirm'] = $this->language->get('entry_confirm');

        $this->data['button_continue'] = $this->language->get('button_continue');

        /** сократил передачу параметров */
        foreach ($this->error as $key => $val){
            $this->data['error_'.$key] = $val;

        }

        $this->data['action'] = $this->url->link('account/register', '', 'SSL');

        /** сократил передачу параметров */
        foreach ($this->request->post as $key => $val){
            $this->data[$key] = $val;

        }


        //$this->data['country_id'] = $this->config->get('config_country_id');
        /** Костыль для страны и региона. По умолчанию ставим Россия - Москва **/
        $this->data['country_id']  = 176;
        $this->data['zone_id']     = 2761;
        /***************************************************/


        //$this->load->model('localisation/country');

        //$this->data['countries'] = $this->model_localisation_country->getCountries();

        if (isset($this->request->post['password'])) {
            $this->data['password'] = $this->request->post['password'];
        } else {
            $this->data['password'] = '';
        }

        if (isset($this->request->post['confirm'])) {
            $this->data['confirm'] = $this->request->post['confirm'];
        } else {
            $this->data['confirm'] = '';
        }

        if (isset($this->request->post['newsletter'])) {
            $this->data['newsletter'] = $this->request->post['newsletter'];
        } else {
            $this->data['newsletter'] = '';
        }

        if ($this->config->get('config_account_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

            if ($information_info) {
                $this->data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/info', 'information_id=' . $this->config->get('config_account_id'), 'SSL'), $information_info['title'], $information_info['title']);
            } else {
                $this->data['text_agree'] = '';
            }
        } else {
            $this->data['text_agree'] = '';
        }

        if (isset($this->request->post['agree'])) {
            $this->data['agree'] = $this->request->post['agree'];
        } else {
            $this->data['agree'] = false;
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/register.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/account/register.tpl';
        } else {
            $this->template = 'default/template/account/register.tpl';
        }

        $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }

    private function validate()
    {


        if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
            $this->error['lastname'] = $this->language->get('error_lastname');
        }

        if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
            $this->error['firstname'] = $this->language->get('error_firstname');
        }

        if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
            $this->error['email'] = $this->language->get('error_email');
        }

        if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
            $this->error['warning'] = $this->language->get('error_exists');
        }
        if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
            $this->error['telephone'] = $this->language->get('error_telephone');
        }


        $this->load->model('localisation/country');

        $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

        if ($country_info && $country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
            $this->error['postcode'] = $this->language->get('error_postcode');
        }


        if ((utf8_strlen($this->request->post['city']) < 2) || (utf8_strlen($this->request->post['city']) > 128)) {
            $this->error['city'] = $this->language->get('error_city');
        }

        if ((utf8_strlen($this->request->post['address_1']) < 3) || (utf8_strlen($this->request->post['address_1']) > 128)) {
            $this->error['address_1'] = $this->language->get('error_address_1');
        }

        if ($this->request->post['country_id'] == '') {
            $this->error['country'] = $this->language->get('error_country');
        }

        if ($this->request->post['zone_id'] == '') {
              $this->error['zone'] = $this->language->get('error_zone');
        }

        if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
            $this->error['password'] = $this->language->get('error_password');
        }

        if ($this->request->post['confirm'] != $this->request->post['password']) {
            $this->error['confirm'] = $this->language->get('error_confirm');
        }

        if ($this->config->get('config_account_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

            if ($information_info && !isset($this->request->post['agree'])) {
                $this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
            }
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function zone()
    {
        $output = '<option value="">' . $this->language->get('text_select') . '</option>';

        $this->load->model('localisation/zone');

        $results = $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']);

        foreach ($results as $result) {
            $output .= '<option value="' . $result['zone_id'] . '"';

            if (isset($this->request->get['zone_id']) && ($this->request->get['zone_id'] == $result['zone_id'])) {
                $output .= ' selected="selected"';
            }

            $output .= '>' . $result['name'] . '</option>';
        }

        if (!$results) {
            $output .= '<option value="0">' . $this->language->get('text_none') . '</option>';
        }

        $this->response->setOutput($output);
    }


    private function validateAjax(){

        foreach ($this->request->post['form'] as $key=>$val ){
            if ($key != 'undefined')
                $this->request->post[$val['name']] = $val['value'];
        }

        //print_r($this->request->post); exit;
        if ($this->request->post['form']['agree']['attr'] == 'checked'){
            $this->request->post['agree'] = 1;
        }
        else
            unset($this->request->post['agree']);

        unset($this->request->post['form']);


        return $this->validate();
    }
}