<?php
// Heading
$_['heading_title']                     = 'Elemento import';
$_['text_openbay']                      = 'OpenBay Pro';
$_['text_ebay']                         = 'eBay';

// Text
$_['text_sync_import_line1']            = '<strong>¡Precaución!</strong> Esto importará todos sus productos de eBay y construir una estructura de la categoría en su tienda. Se recomienda que elimine todas las categorías y productos antes de ejecutar esta opción. <br />Tque la estructura de categorías es de las categorías de eBay normales, no sus categorías de taller (si usted tiene una tienda eBay). Puede cambiar el nombre, eliminar y editar las categorías importadas sin afectar sus productos de eBay.';
$_['text_sync_import_line3']            = 'Usted necesita asegurarse de que su servidor puede aceptar y procesar grandes tamaños de los datos POST. 1.000 artículos de eBay es sobre 40Mb de tamaño, usted tendrá que calcular lo que usted requiere. Si la llamada falla, entonces lo más probable es que su entorno es demasiado pequeño. Su límite de memoria PHP tiene que ser acerca de 128Mb.';
$_['text_sync_server_size']             = 'Actualmente el servidor puede aceptar:';
$_['text_sync_memory_size']             = 'Su límite de memoria PHP: ';
$_['text_import_confirm']				= 'Esto va a importar todos tus artículos de eBay como nuevos productos, ¿estás seguro? Este puede no se puede deshacer! Asegúrese de que tienes una copia de seguridad primero!';
$_['text_import_notify']				= 'Se ha enviado tu solicitud de importación para su procesamiento. Una importación toma alrededor de 1 hora 1000 artículos.';
$_['text_import_images_msg1']           = 'las imágenes están pendientes de importación/copia de eBay. Actualizar esta página, si el número no disminuye después';
$_['text_import_images_msg2']           = 'Haga un clic aquí';
$_['text_import_images_msg3']           = 'y esperar. Más información acerca de por qué ocurrió esto se puede encontrar <a href="http://shop.openbaypro.com/index.php?route=information/faq&topic=8_45" target="_blank">aqui</a>';

// Entry
$_['entry_import_item_advanced']        = 'Datos avanzados';
$_['entry_import_categories']         	= 'Categorías de importación';
$_['entry_import_description']			= 'Descripciones de artículos de importación';
$_['entry_import']						= 'Importación de artículos de eBay';

// Buttons
$_['button_import']						= 'Importar';

// Help
$_['help_import_item_advanced']        	= 'Tardará hasta 10 veces más para importar artículos. Importaciones pesos, tamaños, ISBN y más si está disponible';
$_['help_import_categories']         	= 'Construye una estructura de categoría en su tienda de las categorías de eBay';
$_['help_import_description']         	= 'Esto importará todo, incluyendo HTML, contador de visitas, etc';

// Error
$_['error_import']                   	= 'Error al cargar';
$_['error_maintenance']					= 'Su tienda está en modo de mantenimiento. Importación fallará!';
$_['error_ajax_load']					= 'No se pudo conectar al servidor';
$_['error_validation']					= 'Necesita registrarse para su token API y activar el módulo.';