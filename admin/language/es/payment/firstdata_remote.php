<?php
// Heading
$_['heading_title']					= 'Primeros datos de servicio EMEA Web API';

// Text
$_['text_firstdata_remote']			= '<img src="view/image/payment/firstdata.png" alt="First Data" title="First Data" style="border: 1px solid #EEEEEE;" />';
$_['text_payment']					= 'Pago';
$_['text_success']					= 'Éxito: Ha modificado los datos de cuenta de First Data!';
$_['text_edit']                     = 'Editar primeros datos API de servicio Web de EMEA';
$_['text_card_type']				= 'Tipo de tarjeta';
$_['text_enabled']					= 'Activado';
$_['text_merchant_id']				= 'Tienda ID';
$_['text_subaccount']				= 'Subcuenta';
$_['text_user_id']					= 'User ID';
$_['text_capture_ok']				= 'La captura fue exitosa';
$_['text_capture_ok_order']			= 'La captura fue exitosa, estado actualizado al éxito - colocado de la orden';
$_['text_refund_ok']				= 'Reembolso fue un éxito';
$_['text_refund_ok_order']			= 'Reembolso fue exitoso, estado actualizado a la devolución de la orden';
$_['text_void_ok']					= 'Vacío era acertado, estado actualizado a la anulación de la orden';
$_['text_settle_auto']				= 'Venta';
$_['text_settle_delayed']			= 'Pre auth';
$_['text_mastercard']				= 'Mastercard';
$_['text_visa']						= 'Visa';
$_['text_diners']					= 'Diners';
$_['text_amex']						= 'American Express';
$_['text_maestro']					= 'Maestro';
$_['text_payment_info']				= 'Información de pago';
$_['text_capture_status']			= 'Pago capturado';
$_['text_void_status']				= 'Pago anulado';
$_['text_refund_status']			= 'Pago devuelto';
$_['text_order_ref']				= 'Referencia de la orden';
$_['text_order_total']				= 'Total autorizado';
$_['text_total_captured']			= 'Total capturado';
$_['text_transactions']				= 'Transacciones';
$_['text_column_amount']			= 'Cantidad';
$_['text_column_type']				= 'Tipo';
$_['text_column_date_added']		= 'Creado';
$_['text_confirm_void']				= '¿Está seguro que desea anular el pago?';
$_['text_confirm_capture']			= '¿Está seguro que desea capturar el pago?';
$_['text_confirm_refund']			= '¿Seguro que quieres liberar el pago?';

// Entry
$_['entry_certificate_path']		= 'Ruta del certificado';
$_['entry_certificate_key_path']	= 'Ruta de la clave privada';
$_['entry_certificate_key_pw']		= 'Contraseña de clave privada';
$_['entry_certificate_ca_path']		= 'Ruta de CA';
$_['entry_merchant_id']				= 'Tienda ID';
$_['entry_user_id']					= 'User ID';
$_['entry_password']				= 'Clave';
$_['entry_total']					= 'Total';
$_['entry_sort_order']				= 'Orden de clasificación';
$_['entry_geo_zone']				= 'Zona geo';
$_['entry_status']					= 'Estado';
$_['entry_debug']					= 'Depurar registro';
$_['entry_auto_settle']				= 'Tipo de liquidación';
$_['entry_status_success_settled']	= 'Éxito - colocado';
$_['entry_status_success_unsettled'] = 'Éxito - no resuelta';
$_['entry_status_decline']			 = 'Declinar';
$_['entry_status_void']				 = 'Anuladas';
$_['entry_status_refund']			 = 'Reembolsado';
$_['entry_enable_card_store']		 = 'Habilitar tokens de almacenamiento tarjeta';
$_['entry_cards_accepted']			 = 'Tipos de tarjetas aceptados';

// Help
$_['help_total']					 = 'La total de la orden debe ser recibido antes de que este método de pago se convierte en activo';
$_['help_certificate']				 = 'Certificados y claves privadas deben guardarse fuera de tus carpetas web pública';
$_['help_card_select']				 = 'Solicitar al usuario que elija su tipo de tarjeta antes de que ellos son redireccionados';
$_['help_notification']				 = 'Debe proporcionar esta URL a First Data para obtener notificaciones de pago';
$_['help_debug']					 = 'Activar depuración escribirá los datos confidenciales en un archivo de registro. Siempre debe desactivar a menos instruya lo contrario .';
$_['help_settle']					 = 'Si utilizas pre-auth debe completar una acción post-auth dentro de 3-5 días de lo contrario que se retirarán su transacción';

// Tab
$_['tab_account']					 = 'Información de la API';
$_['tab_order_status']				 = 'Estado del pedido';
$_['tab_payment']					 = 'Opciones de pago';

// Button
$_['button_capture']				= 'Captura';
$_['button_refund']					= 'Reembolso';
$_['button_void']					= 'Vacío';

// Error
$_['error_merchant_id']				= 'ID de Tienda es necesario';
$_['error_user_id']					= 'Se necesita el ID de usuario';
$_['error_password']				= 'Se requiere contraseña';
$_['error_certificate']				= 'Ruta del certificado es necesario';
$_['error_key']						= 'Certificado clave se requiere';
$_['error_key_pw']					= 'Se requiere una contraseña de clave de certificado';
$_['error_ca']						= 'Autoridad de certificación (CA) se requiere';