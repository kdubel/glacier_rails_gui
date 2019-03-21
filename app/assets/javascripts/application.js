// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .


$( document ).ready(function() {
    // New Glacier job scripts
    $('#new_glacier_job #select_region button').click(function() {
        console.log('test')
        region = $(this).parent().children('select').val();
        $.ajax({
            url: "/user_panel/glacier_jobs/get_all_vaults",
            data: {
                region: region
            },
            success: function( result ) {
                addTableRows($('#new_glacier_job #vault_select table tbody'), result, region);
                $('#new_glacier_job #vault_select').show();
            }

        });
    })
});

function addTableRows(table, data, region) {
    table.empty();
    data.forEach(function(e) {
        row = "<tr class='table-row' data-href='/user_panel/glaciers/show_by_name?vault_name="+e['name']+"&region_name="+region+"'>" +
        "<td>"+ e['name'] +"</td>" +
        "<td>"+ e['created_at'] +"</td>" +
        "<td>"+ e['updated_at'] +"</td>" +
        "<td>"+ e['archives_no'] +"</td>" +
        "<td>"+ e['size'] +"</td>" +
        "</tr>";
        console.log(row);
        table.append(row);
    })
    if(data.length == 0) {
        table.append("<tr><td colspan=5>No data for selected region</td></tr>")
    }
    $(".table-row").click(function() {
        window.document.location = $(this).data("href");
    });
}