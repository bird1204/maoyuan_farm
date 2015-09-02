  $('#all').click(function(){
    $('input:checkbox').prop('checked', this.checked);  
  })
  $(document).on('click','#del',function(){
    var product_ids = [];
      $('input:checked').each(function() {
        if (this.value != 'all'){ product_ids.push($(this).val());}
      });

      $.get( "<%=carts_path%>",{product_ids : product_ids}, null, 'script');
  });