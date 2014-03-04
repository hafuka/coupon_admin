$(function(){
	// Check for the various File API support.
	if (window.File && window.FileReader && window.FileList && window.Blob) {
	} else {
	  alert('The File APIs are not fully supported in this browser.');
	}
    
    
	function handleFileSelect(evt) {
		
		$('#list').html('');
		
	    var files = evt.target.files; // FileList object

	    // Loop through the FileList and render image files as thumbnails.
	    var f = files[0];
	      // Only process image files.
	      if (!f.type.match('image.*')) {
	    	  alert('file is noe iamge ');
	        return;
	      }

	      var reader = new FileReader();

	      // Closure to capture the file information.
	      reader.onload = (function(theFile) {
	        return function(e) {
	          // Render thumbnail.
	          var span = document.createElement('span');
	          span.innerHTML = ['<img class="thumb" src="', e.target.result,'" title="', escape(theFile.name), '"/>'].join('');
	          document.getElementById('list').insertBefore(span, null);
	          $('#hdn_imamge').val(e.target.result);
	        };
	      })(f);

	      // Read in the image file as a data URL.
	      reader.readAsDataURL(f);
	  }

	  document.getElementById('files').addEventListener('change', handleFileSelect, false);
});