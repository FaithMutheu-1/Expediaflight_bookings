$(document).ready(function () {
    const addnewbutton = $("#addnewcity"),
        citydetailsmodal = $("#citydetailsmodal"),
        filtercountrylist = $("#filtercountry"),
        citycountrylist = $("#citydetailscountry"),
        filtercitynotifications = $("#filtercitynotifications"),
        citynamefield = $("#citydetailscityname"),
        savecitybutton = $("#savecity"),
        citydetailsnotifications = $("#citydetailsnotifications"),
        cityidfield = $("#cityid"),

        // global variables
        inputfield = $("input"),
        selectfield = $("select");

    // Load countries from the database
    getcountries(filtercountrylist, "all");
    getcountries(citycountrylist, "choose");

    inputfield.on("input", function () {
        citydetailsnotifications.html("");
    });

    selectfield.on("change", function () {
        inputfield.trigger("input");
    });

    // Show modal when adding new city
    addnewbutton.on("click", function () {
        cityidfield.val("0"); // reset ID for new city
        citynamefield.val(""); // clear name
        citycountrylist.val(""); // reset country
        citydetailsnotifications.html(""); // clear old alerts
        citydetailsmodal.modal("show");
    });

    // Fetch countries
    function getcountries(obj, option = "choose") {
        $.getJSON("controllers/countryoperations.php", { getcountries: true })
            .done(function (data) {
                let results =
                    option === "choose"
                        ? <option value=''>&lt;choose&gt;</option>
                        : <option value='0'>&lt;All&gt;</option>;
                data.forEach(function (country) {
                    results += <option value='${country.countryid}'>${country.countryname}</option>;
                });
                obj.html(results);
            })
            .fail(function (response) {
                filtercitynotifications.html(
                    <div class='alert alert-danger'>${response.responseText}</div>
                );
            });
    }

    // Save city
    savecitybutton.on("click", function () {
        const cityid = cityidfield.val(),
            countryid = citycountrylist.val(),
            cityname = citynamefield.val();

        if (countryid === "") {
            citydetailsnotifications.html(
                <div class='alert alert-info'>Please select country first</div>
            );
            citycountrylist.focus();
        } else if (cityname === "") {
            citydetailsnotifications.html(
                <div class='alert alert-info'>Please provide city name first</div>
            );
            citynamefield.focus();
        } else {
            $.post(
                "controllers/cityoperations.php",
                {
                    savecity: true,
                    cityid: cityid,
                    cityname: cityname,
                    countryid: countryid,
                },
                function (data) {
                    if (isJSON(data)) {
                        data = JSON.parse(data);
                        if (data.status === "success") {
                            citydetailsnotifications.html(
                                <div class='alert alert-success'>The city was saved successfully</div>
                            );
                            citynamefield.val("").focus();
                            cityidfield.val("0");
                        } else if (data.status === "exists") {
                            citydetailsnotifications.html(
                                <div class='alert alert-info'>The city name already exists</div>
                            );
                            citynamefield.focus();
                        }
                    } else {
                        citydetailsnotifications.html(
                            <div class='alert alert-danger'>Sorry an error occurred: ${data}</div>
                        );
                    }
                }
            );
        }
    });

    function isJSON(str) {
        if (typeof str !== "string") return false;
        try {
            JSON.parse(str);
            return true;
        } catch (e) {
            return false;
        }
    }
});