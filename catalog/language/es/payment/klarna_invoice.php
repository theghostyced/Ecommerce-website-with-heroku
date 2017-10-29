<?php
// Text
$_['text_title']				= 'Klarna factura - pago dentro de 14 días';
$_['text_terms_fee']			= '<span id="klarna_invoice_toc"></span> (+%s) <script type="text/javascript"> términos var = new Klarna.Terms.Invoice ({el: \'klarna_invoice_toc\', eid: \'%s\', país: \'%s\', cargo: %s});</script>';
$_['text_terms_no_fee']			= '<span id="klarna_invoice_toc"></span><script type="text/javascript">var terms = new Klarna.Terms.Invoice({el: \'klarna_invoice_toc\', eid: \'%s\', country: \'%s\'});</script>';
$_['text_additional']			= 'Klarna factura requiere alguna información adicional antes de que puedan proceso de su orden.';
$_['text_male']					= 'Hombre';
$_['text_female']				= 'Mujer';
$_['text_year']					= 'Año';
$_['text_month']				= 'Mes';
$_['text_day']					= 'Día';
$_['text_comment']				= 'Klarna\'s Invoice ID: %s. ' . "\n" . '%s/%s: %.4f';

// Entry
$_['entry_gender']				= 'Género';
$_['entry_pno']					= 'Número Personal';
$_['entry_dob']					= 'Fecha de nacimiento';
$_['entry_phone_no']			= 'Número de teléfono';
$_['entry_street']				= 'Calle';
$_['entry_house_no']			= 'Casa no.';
$_['entry_house_ext']			= 'Casa ext.';
$_['entry_company']				= 'Número de registro de empresa';

// Help
$_['help_pno']					= 'Por favor ingrese su número de Seguro Social aquí.';
$_['help_phone_no']				= 'Por favor ingrese su número de teléfono.';
$_['help_street']				= 'Por favor, tenga en cuenta que entrega sólo puede tener lugar a domicilio al pagar con Klarna.';
$_['help_house_no']				= 'Por favor ingrese su número de teléfono.';
$_['help_house_ext']			= 'Por favor envie su extensión de casa aquí. Por ejemplo A, B, C, ect rojo, azul.';
$_['help_company']				= 'Por favor ingrese su número de registro de';

// Error
$_['error_deu_terms']			= 'Debes estar de acuerdo a la política de privacidad de Klarna (Datenschutz)';
$_['error_address_match']		= 'Direcciones de envío y facturación deben coincidir si desea utilizar Klarna factura';
$_['error_network']				= 'Error al conectar al Klarna. Inténtalo de nuevo más tarde.';