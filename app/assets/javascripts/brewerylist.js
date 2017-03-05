var BREWERIES = {};

BREWERIES.show = function () {
    $("#brewerytable tr:gt(0)").remove();

    var table = $("#brewerytable");

    $.each(BREWERIES.list, function (index, brewery) {
        table.append('<tr>'
            + '<td>' + brewery['name'] + '</td>'
            + '<td>' + brewery['amount']['amount'] + '</td>'
            + '<td>' + brewery['founded']['year'] + '</td>'
            + '<td>' + brewery['active']['active'] + '</td>'
            + '</tr>');
    });
};

BREWERIES.sort_by_name = function () {
    BREWERIES.list.sort(function (a, b) {
        return a.name.toUpperCase().localeCompare(b.name.toUpperCase());
    });
};

BREWERIES.sort_by_founded = function () {
    BREWERIES.list.sort(function (a, b) {
        return a.year - b.year;

    });
};

BREWERIES.sort_by_beers = function () {
  BREWERIES.list.sort(function (a, b) {
      return a.amount - b.amount;
  })
};

$(document).ready(function () {
    if ($("#brewerytable").length > 0) {

        $("#name").click(function (e) {
            BREWERIES.sort_by_name();
            BREWERIES.show();
            e.preventDefault();
        });
        $("#founded").click(function (e) {
            BREWERIES.sort_by_founded();
            BREWERIES.show();
            e.preventDefault();
        });
        $("#amount").click(function (e) {
            BREWERIES.sort_by_beers();
            BREWERIES.show();
            e.preventDefault();
        });
        $.getJSON('breweries.json', function (breweries) {
            BREWERIES.list = breweries;
            BREWERIES.sort_by_name();
            BREWERIES.show();
        });

    }
});