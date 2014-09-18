	//Función para validar campos de un formulario.
	document.getElementById('btnAgregar').onclick=function validarForm () {

		var nombre, apellidos, cedula, email, telCasa, telCel, nvlIngles, datosValidos;		
		
		//Almacenamiento de cada value del formulario en una variable .	
		nombre = document.getElementById('txtNombre').value;
		apellidos = document.getElementById('txtApellidos').value;
	cedula = document.getElementById('txtCedula').value;
	email = document.getElementById('txtEmail').value;
	telCasa = document.getElementById('txtTelCasa').value;
	telCel = document.getElementById('txtTelCel').value;
	nvlIngles = document.getElementById('txtNvlIngles').value;
      	
      	// Validar nombre.
		if (estaVacio(nombre, 'errorNombre', 'txtNombre')){
			datosValidos=false;			
		}else{
			if(esTexto(nombre, 'errorNombre', 'txtNombre')){
				datosValidos=true;
			}	
		}

		//Validar apellidos.
		if (estaVacio(apellidos, 'errorApellidos', 'txtApellidos')){
			datosValidos=false;	
		}else{
			if(esTexto(apellidos, 'errorApellidos', 'txtApellidos')){
				datosValidos=true;
			}
		}

		//Validar cedula.
		if (estaVacio(cedula, 'errorCedula', 'txtCedula')){
			datosValidos=false;	
		}else{
			if(esNumero(cedula, 'errorCedula', 'txtCedula')){
				datosValidos=true;
			}
		}	

		//Validar email.
		if (estaVacio(email, 'errorEmail', 'txtEmail')){
			datosValidos=false;	
		}else{
			if(validarEmail(email, 'errorEmail', 'txtEmail')){
				datosValidos=true;
			}
		}	

		//Validar telefono de casa. 
		if (esNumero(telCasa, 'errorTelCasa', 'txtTelCasa')){
			datosValidos=true;	
		}else{
			datosValidos=false;
		}	

		//Validar telefono celular.
		if(esNumero(telCel, 'errorTelCel', 'txtTelCel')){
			datosValidos=true;
		}else{
			datosValidos=false;
		}	

		//Validar nivel de ingles.
		if(esNumero(nvlIngles, 'errorNvlIngles', 'txtNvlIngles')){
			datosValidos=true;
		}else{
			datosValidos=false;
		}

  		/*Función para validar que el campo no esté vacío. 
  		Parametros: pdato, valor a evaluar.
  					pspan, nombre del span donde se desplegará el error.
  					pcampo, campo del formulario que será demarcado en campo de que tenga algún error.
		Retorna:    esValido, verifica si es valido o no.
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

   		/*Función para validar que el campo sea numérico. 
  		Parametros: pdato, valor a evaluar.
  					pspan, nombre del span donde se desplegará el error.
  					pcampo, campo del formulario que será demarcado en campo de que tenga algún error.
		Retorna:    esValido, verifica si es valido o no.
  		*/
        function esNumero(pdato, pspan, pcampo)  {

          	var esValido = true,
          	regexNum = /^[0-9]*$/;

          	if (regexNum.test(pdato) === false){
          		document.getElementById(pcampo).className='errorInput';
				document.getElementById(pspan).innerHTML='* Formato inválido';	
				esValido = false;
          	} else {
          		document.getElementById(pcampo).className='limpiarInput';
          		document.getElementById(pspan).innerHTML='';	
          	}
          	return esValido;
          }

      	/*Función para validar que el campo sea texto. 
		Parametros: pdato, valor a evaluar.
					pspan, nombre del span donde se desplegará el error.
					pcampo, campo del formulario que será demarcado en campo de que tenga algún error
		Retorna:    esValido, verifica si es valido o no.
		*/
      	function esTexto(pdato, pspan, pcampo)  {

      	var esValido = true,
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

        /*Función para validar que el campo contenga un email con formato valido. 
		Parametros: pdato, valor a evaluar.
					pspan, nombre del span donde se desplegará el error.
					pcampo, campo del formulario que será demarcado en campo de que tenga algún error.
		Retorna:    esValido, verifica si es valido o no.
		*/
     	function validarEmail(dato, span, campo)  {

			var esValido = true,
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
     	
     	return datosValidos;
   };

   