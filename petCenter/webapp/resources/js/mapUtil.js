/**
 * 
 */

	function pad(val){
		
	    let valString = val + "";
	    if(valString.length < 2){ return "0" + valString; }
	    else{ return valString; }
	}			