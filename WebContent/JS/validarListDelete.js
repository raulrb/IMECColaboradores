	document.getElementById('btnEliminar').onclick=function validarDelete () {
		var checkboxs=document.getElementsByName("idCbx");
	    var okay=false;
	    for(var i=0; i<checkboxs.length;i++)
	    {
	        if(checkboxs[i].checked)
	        {
	            okay=true;
	        }
	    }
	    if(!okay){
	    	alert("Debe seleccionar algun colaborador antes de eliminar.");
	    	return false;
	    }else{
	    	return true;
	    }
	}
