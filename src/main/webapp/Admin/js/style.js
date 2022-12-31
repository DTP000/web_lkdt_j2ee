function convert_name(str) {
	var newStr = str.replace(/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/g, "a");
	newStr = newStr.replace(/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/g, 'e');
	newStr = newStr.replace(/(ì|í|ị|ỉ|ĩ|Ì|Í|Ị|Ỉ|Ĩ)/g, 'i');
	newStr = newStr.replace(/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/g, 'o');
	newStr = newStr.replace(/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/g, 'u');
	newStr = newStr.replace(/(ỳ|ý|ỵ|ỷ|ỹ|Ỳ|Ý|Ỵ|Ỷ|Ỹ)/, 'y');
	newStr = newStr.replace(/(đ|Đ)/g, 'd');
	newStr = newStr.replace(/(\“|\”|\‘|\’|\,|\!|\&|\;|\@|\#|\%|\~|\`|\=|\_|\'|\]|\[|\}|\{|\)|\(|\+|\^)/g, '-');
	newStr = newStr.replace(/( )/g, '-');
	
	return newStr.toLowerCase();
}

function format_curency(a) {
  	a.value = a.value.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
}

function convert_price(a) {
	var price = a.replace(/(,)/g, '');
	return price;
}

$(function(){
  $('#img_product').change(function(){
    var input = this;
    var url = $(this).val();
    console.log(input);
    console.log(input.files[0].name)
    var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
    if (input.files && input.files[0]&& (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) 
     {
        var reader = new FileReader();

        reader.onload = function (e) {
           $('#img').attr('src', e.target.result);
        }
       reader.readAsDataURL(input.files[0]);
    }
    else
    {
      $('#img').attr('src', '/assets/no_preview.png');
    }
  });

});


$(document).on('click', '#productDetails', function (e) {
	e.preventDefault();
	var id = $(this).data('id');
	// console.log(id);
	var temp = 1;
        $.ajax({
	        type: "GET",
	        url : "../Ajax",
	        data : {
				id : id,
				ajax : '1'
	        },
	        success: function(responseJson){
                if(responseJson!=null){
                    $("#productTable").find("tr:gt(0)").remove();
                    var table1 = $("#productTable");	
                    $.each(responseJson, function(key, value){
					var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td></tr>");
					rowNew.children().eq(0).text(temp++);
					rowNew.children().eq(1).text(value['productName']);
                    rowNew.children().eq(2).text(value['quantity']);
                    rowNew.children().eq(3).text(value['price']);
                    rowNew.children().eq(4).text(value['note']);
                    rowNew.appendTo(table1);
		            	});
		         }
			}
       })                      
}); 

$(document).on('click', '#cancelOrder', function (e) {
    e.preventDefault();
    var room_id = $(this).data('id');   
    console.log(room_id);
     $('#idOrder').val(room_id);

});


function url_link(a) {
	var b = convert_name(a);
	$('#url_product').val(b);
}


$('#noteCancelOrder').submit(function () {
	var note = $('#edit_room_no').val();
	var id = $('#idOrder').val();
	
	$.ajax({
	        type: "GET",
	        url : "../Ajax",
	        data : {
				id : id,
				response : note,
				ajax : '2'
	        },
	        success: function(responseJson){
                if(responseJson){
                    window.location.href = './unprocessedOrder';
            	} else {
                $('.edit_response').html('<div class="alert bg-danger alert-dismissable" role="alert"><em class="fa fa-lg fa-warning">&nbsp;</em>DataBase Error</div>');
            }	
			}
       }) 
});

$(document).on('click', '#imgProduct', function (e) {
	e.preventDefault();
	var id = $(this).data('id');
	console.log(id);
	$.ajax({
	        type: "GET",
	        url : "../Ajax",
	        data : {
				id : id,
				ajax : '3'
	        },
	        success: function(responseJson){
			
                if(responseJson != null){
                	$.each(responseJson, function(key, value){
						$("#imgProductDetail").attr("src",value['image']);
					});
                } else {
					console.log("chịu luôn");
				}
			}
       }) 
});

$('#addAProduct').submit(function (e) {
	e.preventDefault();
	var id_category = $('#id_category').val();
	var name_product = $('#name_product').val();
	var price_product = convert_price($('#price_product').val());
	var quantity_product = $('#quantity_product').val();
	var url_product = $('#url_product').val();
	console.log(id_category)
	$.ajax({
	        type: "GET",
	        url : "../Ajax",
	        data : {
				id_category : id_category,
				name_product :name_product,
				price_product : price_product,
				quantity_product : quantity_product,
				url_product : url_product,
				ajax : '4'
	        },
            success: function(responseJson){
	            if(responseJson){
	                $('.response').html("<div class='alert alert-success'><span class='glyphicon glyphicon-info-sign'></span> &nbsp; Thêm Thành Công !</div>");
	                document.getElementById("addAProduct").reset();
	        	} else {
	            	$('.response').html('<div class="alert bg-danger alert-dismissable" role="alert"><em class="fa fa-lg fa-warning">&nbsp;</em>Thêm Không Thành Công</div>');
	        	}	
			}
       })
});
/*
function format(d) {
    return (
        'Full name: ' +
        d.first_name +
        ' ' +
        d.last_name +
        '<br>' +
        'Salary: ' +
        d.salary +
        '<br>' +
        'The child row can contain any data you wish, including links, images, inner tables etc.'
    );
}
 
$(document).ready(function () {
    var dt = $('#example').DataTable({
        processing: true,
        serverSide: true,
        ajax: 'scripts/ids-objects.php',
        columns: [
            {
                class: 'details-control',
                orderable: false,
                data: null,
                defaultContent: '',
            },
            { data: 'first_name' },
            { data: 'last_name' },
            { data: 'position' },
            { data: 'office' },
        ],
        order: [[1, 'asc']],
    });
 
    // Array to track the ids of the details displayed rows
    var detailRows = [];
 
    $('#example tbody').on('click', 'tr td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = dt.row(tr);
        var idx = detailRows.indexOf(tr.attr('id'));
 
        if (row.child.isShown()) {
            tr.removeClass('details');
            row.child.hide();
 
            // Remove from the 'open' array
            detailRows.splice(idx, 1);
        } else {
            tr.addClass('details');
            row.child(format(row.data())).show();
 
            // Add to the 'open' array
            if (idx === -1) {
                detailRows.push(tr.attr('id'));
            }
        }
    });
 
    // On each draw, loop over the `detailRows` array and show any child rows
    dt.on('draw', function () {
        detailRows.forEach(function(id, i) {
            $('#' + id + ' td.details-control').trigger('click');
        });
    });
});*/