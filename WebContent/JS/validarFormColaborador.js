	//FunciÃ³n para validar campos de un formulario.
	document.getElementById('btnAgregar').onclick=function validarForm () {

		var nombre, apellidos, cedula, email, telCasa, telCel, nvlIngles, cantValidos = 0;		
		
		// Almacenamiento de cada value del formulario en una variable .
		nombre = document.getElementById('txtNombre').value;
		apellidos = document.getElementById('txtApellidos').value;
		cedula = document.getElementById('txtCedula').value;
		email = document.getElementById('txtEmail').value;
		telCasa = document.getElementById('txtTelCasa').value;
		telCel = document.getElementById('txtTelCel').value;
		nvlIngles = document.getElementById('txtNvlIngles').value;
      	
      	// Validar nombre.
		if (!estaVacio(nombre, 'errorNombre', 'txtNombre')){
			if(esTexto(nombre, 'errorNombre', 'txtNombre')){
				cantValidos++;
			}
		}			

		// Validar apellidos.
		if (!estaVacio(apellidos, 'errorApellidos', 'txtApellidos')){
			if(esTexto(apellidos, 'errorApellidos', 'txtApellidos')){
				cantValidos++;
			}
		}
		
		// Validar cedula.
		if (!estaVacio(cedula, 'errorCedula', 'txtCedula')){
			if(esNumero(cedula, 'errorCedula', 'txtCedula')){
				if(validarCedula(cedula, 'errorCedula', 'txtCedula')){
					cantValidos++;
				}
			}
		}	

		// Validar email.
		if (!estaVacio(email, 'errorEmail', 'txtEmail')){
			if(validarEmail(email, 'errorEmail', 'txtEmail')){
				cantValidos++;
			}
		}	

		// Validar telefono de casa.
		if (!estaVacioOpcional(telCasa)){
			if(esNumero(telCasa, 'errorTelCasa', 'txtTelCasa')){
				if(validarTelefono(telCasa, 'errorTelCasa', 'txtTelCasa')){
					cantValidos++;
				}	
			}
		}else{
			cantValidos++;
		}	

		// Validar telefono celular.
		if (!estaVacio(telCel, 'errorTelCel', 'txtTelCel')){
			if(esNumero(telCel, 'errorTelCel', 'txtTelCel')){
				if(validarTelefono(telCel, 'errorTelCel', 'txtTelCel')){
					cantValidos++;
				}				
			}
		}	

		// Validar nivel de ingles.
		if (!estaVacio(nvlIngles, 'errorNvlIngles', 'txtNvlIngles')){
			if(esNumero(nvlIngles, 'errorNvlIngles', 'txtNvlIngles')){
				if(validarNvlIngles(nvlIngles, 'errorNvlIngles', 'txtNvlIngles')){
					cantValidos++;
				}				
			}	
		}

  		/*
		 * FunciÃ³n para validar que el campo no estÃ© vacÃ­o. Parametros:
		 * pdato, valor a evaluar. pspan, nombre del span donde se desplegarÃ¡
		 * el error. pcampo, campo del formulario que serÃ¡ demarcado en campo
		 * de que tenga algÃºn error. Retorna: esValido, verifica si es valido o
		 * no.
		 */
        function estaVacio(pdato, pspan, pcampo)  {

          	var estaVacio = false;

          	if (pdato === ''){
          		document.getElementById(pcampo).className='error';
				document.getElementById(pspan).innerHTML='* Información requerida ';	
				estaVacio = true;
          	} else {
          		document.getElementById(pcampo).className='limpiarInput';
          		document.getElementById(pspan).innerHTML='';	
          	}
          	return estaVacio;
          }

        function estaVacioOpcional(pdato){
        	var estaVacio = false;
        	if (pdato === ''){
        		estaVacio = true;
        	}
        	return estaVacio;
        }
   		/*
		 * FunciÃ³n para validar que el campo sea numÃ©rico. Parametros: pdato,
		 * valor a evaluar. pspan, nombre del span donde se desplegarÃ¡ el
		 * error. pcampo, campo del formulario que serÃ¡ demarcado en campo de
		 * que tenga algÃºn error. Retorna: esValido, verifica si es valido o
		 * no.
		 */
        function esNumero(pdato, pspan, pcampo)  {

          	var esValido = true;
          	regexNum = /^\d+$/;
          	
          	if(pdato !== ""){
          		if (regexNum.test(pdato) == false){
              		document.getElementById(pcampo).className='errorInput';
    				document.getElementById(pspan).innerHTML='* Formato inválido';	
    				esValido = false;
              	} else {
              		document.getElementById(pcampo).className='limpiarInput';
              		document.getElementById(pspan).innerHTML='';	
              	}
          	}          	
          	return esValido;
          }

      	/*
		 * FunciÃ³n para validar que el campo sea texto. Parametros: pdato,
		 * valor a evaluar. pspan, nombre del span donde se desplegarÃ¡ el
		 * error. pcampo, campo del formulario que serÃ¡ demarcado en campo de
		 * que tenga algÃºn error Retorna: esValido, verifica si es valido o no.
		 */
      	function esTexto(pdato, pspan, pcampo)  {

	      	var esValido = true;
	      	regexChar = /^[A-Za-z\s'. áéíóúÁÉÍÓÚÑñÜü]+$/;
	
	      	if (regexChar.test(pdato) == false){
	      		document.getElementById(pcampo).className='error';
				document.getElementById(pspan).innerHTML='* Formato inválido';	
				esValido = false;
	      	} else {
	      		document.getElementById(pcampo).className='limpiarInput';
	      		document.getElementById(pspan).innerHTML='';	
	      	}
          	return esValido;
        }

        /*
		 * FunciÃ³n para validar que el campo contenga un email con formato
		 * valido. Parametros: pdato, valor a evaluar. pspan, nombre del span
		 * donde se desplegarÃ¡ el error. pcampo, campo del formulario que serÃ¡
		 * demarcado en campo de que tenga algÃºn error. Retorna: esValido,
		 * verifica si es valido o no.
		 */
     	function validarEmail(dato, span, campo)  {

			var esValido = true;
	      	regexCorreo = /^[0-9a-z_\-\.]+@[0-9a-z\-\.]+\.[a-z]{2,4}$/i;

	      	if (regexCorreo.test(dato) == false){
	      		document.getElementById(campo).className='error';
				document.getElementById(span).innerHTML='* Formato inválido';	
				esValido = false;
	      	} else {
	      		document.getElementById(campo).className='limpiarInput';
	      		document.getElementById(span).innerHTML='';	
	      		
	      	}
	      	return esValido;
	    }
     	
     	
     	/*
		 * Función para validar que el campo contenga una cedula con formato
		 * valido. Parametros: pdato, valor a evaluar. pspan, nombre del span
		 * donde se desplegarÃ¡ el error. pcampo, campo del formulario que serÃ¡
		 * demarcado en campo de que tenga algÃºn error. Retorna: esValido,
		 * verifica si es valido o no.
		 */
     	function validarCedula(dato, span, campo)  {

			var esValido = true;
	      	regexCedula = /^\d{9}$/;

	      	if (regexCedula.test(dato) == false){
	      		document.getElementById(campo).className='error';
				document.getElementById(span).innerHTML='* Ingrese 9 digitos.';	
				esValido = false;
	      	} else {
	      		document.getElementById(campo).className='limpiarInput';
	      		document.getElementById(span).innerHTML='';	
	      		
	      	}
	      	return esValido;
	    }
     	
     	/*
		 * Función para validar que el campo contenga un numero de telefono con
		 * formato valido. Parametros: pdato, valor a evaluar. pspan, nombre del
		 * span donde se desplegarÃ¡ el error. pcampo, campo del formulario que
		 * serÃ¡ demarcado en campo de que tenga algÃºn error. Retorna:
		 * esValido, verifica si es valido o no.
		 */
     	function validarTelefono(dato, span, campo)  {

			var esValido = true;
			/*
			 * ^\s* #Line start, match any whitespaces at the beginning if any.
			 * (?:\+?(\d{1,3}))? #GROUP 1: The country code. Optional. [-. (]*
			 * #Allow certain non numeric characters that may appear between the
			 * Country Code and the Area Code. (\d{3}) #GROUP 2: The Area Code.
			 * Required. [-. )]* #Allow certain non numeric characters that may
			 * appear between the Area Code and the Exchange number. (\d{3})
			 * #GROUP 3: The Exchange number. Required. [-. ]* #Allow certain
			 * non numeric characters that may appear between the Exchange
			 * number and the Subscriber number. (\d{4}) #Group 4: The
			 * Subscriber Number. Required. (?: *x(\d+))? #Group 5: The
			 * Extension number. Optional. \s*$ #Match any ending whitespaces if
			 * any and the end of string.
			 */
	      	// regexCorreo = /^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-.
			// )]*(\d{4})[-. ]*(\d{4})$/;
			regexTel = /^\d{8}$/;	
	      	if (regexTel.test(dato) == false){
	      		document.getElementById(campo).className='error';
				document.getElementById(span).innerHTML='* Ingrese 8 digitos.';	
				esValido = false;
	      	} else {
	      		document.getElementById(campo).className='limpiarInput';
	      		document.getElementById(span).innerHTML='';	
	      		
	      	}
	      	return esValido;
	    }
     	
     	/*
		 * Función para validar que el campo contenga el nivel de ingles con
		 * formato valido. Parametros: pdato, valor a evaluar. pspan, nombre del
		 * span donde se desplegarÃ¡ el error. pcampo, campo del formulario que
		 * serÃ¡ demarcado en campo de que tenga algÃºn error. Retorna:
		 * esValido, verifica si es valido o no.
		 */
     	function validarNvlIngles(dato, span, campo)  {

			var esValido = true;
			if(dato < 0 || dato >99){
				document.getElementById(campo).className='error';
				document.getElementById(span).innerHTML='* Ingrese un valor entre 0 y 99.';	
				esValido = false;
			}else{
				document.getElementById(campo).className='limpiarInput';
	      		document.getElementById(span).innerHTML='';	
			}
	      	return esValido;
	    }
     	
     	if (cantValidos == 7){
        	return true;
        	  
        } else {
        	return false;
        }
     	
     	
   };

   
