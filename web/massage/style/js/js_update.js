/**
 * Created by conghuyvn8x on 6/27/2018.
 */

function loadItem() {
    var url = $('#load-url').val();
    var page = $('#load-page').val();
    $.ajax({
        url: url,
        type: "post",
        data: {"page": page, "isAll": isAll, "location": locationItem},
        success: function (data) {
            console.log('xx:' + data.errCode);
            if (data.errCode == '0') {
                if (page == 1) {
                    $('#list-item').html(data.html);
                } else {
                    $(data.html).insertAfter($('#list-item .grid-item').last());
                }
                if (page == data.page) {    // het du lieu
                    $('#l-m').hide();
                }
                $('#load-page').val(data.page);
            }
        }
        , error: function (data) {
            console.log('error');
        }
    }).done(function () {
        // finish ajax
        console.log('finish');
    });
}