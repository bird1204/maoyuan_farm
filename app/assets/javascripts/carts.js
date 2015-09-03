    function check_all(obj,cName) 
    { 
        var checkboxs = document.getElementsByName(cName); 
        for(var i=0;i<checkboxs.length;i++){checkboxs[i].checked = obj.checked;} 
    } 
  $(document).on('click','#del',function(){
    var product_ids = [];
      $('input:checked').each(function() {
        if (this.value != 'all'){ product_ids.push($(this).val());}
      });

      $.get( "<%=carts_path%>",{product_ids : product_ids}, null, 'script');
  });