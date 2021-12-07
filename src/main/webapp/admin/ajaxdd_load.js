$('#Bname').dblclick(function () {
	$('#Bname').find('option').remove(); 
    $.ajax({
        url: "../getbrandnDetails",
        method: "GET",
        data: {operation: 'brand'},
        success: function (data, textStatus, jqXHR) {
            
            console.log(data);
            let obj = $.parseJSON(data);
            
            $.each(obj, function (key, value) {
            	
            
                $('#Bname').append('<option value="' + value.Bid + '">' + value.bname + '</option>')
            });
              //$('#Brandname').formSelect(); 
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#Bname').append('<option>Brand Unavailable</option>'); 
        },
        cache: false
    });
});

$('#Bname').change(function () {
    $('#VMname').find('option').remove();
   

    let bid = $('#Bname').val();
    let data = {
        operation: "vmodel",
        id: bid
    };

    $.ajax({
        url: "../getbrandnDetails",
        method: "GET",
        data: data,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            let obj = $.parseJSON(data);
            $.each(obj, function (key, value) {
                $('#VMname').append('<option value="' + value.vmid + '">' + value.vmname + '</option>')
            });
           /*  $('select').formSelect(); */
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#VMname').append('<option>Model Unavailable</option>');
        },
        cache: false
    });
});

