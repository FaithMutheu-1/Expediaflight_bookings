$(document).ready(function(){
    const countrymodal = $("#countrydetailsmodal"),
        addnewcountrybutton = $("#addnewcountry"),
        countryidfield = $("#countryid"),
        countrynamefield = $("#countryname"),
        savecountrybutton = $("#savecountry"),
        notifications = $("#notifications"),
        countriestable= $("#countriestable"),
        countrynotifications = $("#countrynotifications");

    // Load existing countries
    getcountriesastables()

    addnewcountrybutton.on("click", function(){
        countrymodal.modal("show");
    });

    savecountrybutton.on("click", function(){
        const countryid = countryidfield.val(),
            countryname = countrynamefield.val();
     
        if(countryname ==""){
            notifications.html("<div class='alert alert-primary'>Please enter country name</div>");
            countrynamefield.focus();
        }else{
            $.post(
                "controllers/countryoperations.php",
                {
                    savecountry:true,
                    countryid: countryid,
                    countryname: countryname
                },
                function(data){
                    console.log("Raw response:", data);

                    // ✅ data is already JSON (no need for isJSON check)
                    if(data.status === "success"){
                        notifications.html("<div class='alert alert-success'>Country has been saved successfully</div>");
                        countrynamefield.val("");
                        countrynamefield.focus();

                        // Refresh Countries list
                        getcountriesastables()

                    }else if(data.status === "exists"){
                        notifications.html("<div class='alert alert-info'>Country already exists in the system</div>");
                        countrynamefield.focus();
                    }else{
                        notifications.html(<div class='alert alert-danger'>Sorry, an error occurred: ${data.message || "Unknown error"}</div>);
                    }
                },
                "json" // ✅ tell jQuery to parse JSON automatically
            );
        }
    });

    countrynamefield.on("input", function(){
        notifications.html("");
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

    function getcountriesastables(){
        $.getJSON(
            "controllers/countryoperations.php",
            {
                getcountries:true
            }
        ).done(function(data){
            let results=""
            data.forEach(function(country,i){
                results+=<tr><td>${i+1}</td>
                results+=<td>${country.countryname}</td>
                results+=<td>${country.city_count}</td>
                results+=<td>${country.airport_count}</td>
                results+=<td>${country.airline_count}</td>
                results+=<td><a href='#'><i class='fas fa-edit fa-lg'></i></a></td></tr>
            })
            // done with looping through the data that is returned
            countriestable.find("tbody").html(results)
        }).fail(function(response, status, error){
            countrynotifications.html(<div class='alert alert-danger'>${response.responseText}</div>)
            // console.log(Sorry an error occurred ${response.responseText})
        })
    }
});