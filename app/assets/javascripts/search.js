/**
 * Created with JetBrains RubyMine.
 * User: lalli
 * Date: 10/26/13
 * Time: 9:55 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function(){
    function smoothiesModel(){
        this.matchingSmoothies = ko.observableArray([]);
        this.allSmoothies = ko.observableArray([]);
        this.allIngredients = ko.observableArray([]);
        this.wantedIngredients = ko.observableArray([]);


    }
    function updateMatchingSmoothies(){
        matchingSmoothies = [];
        $(smoothiesModel.allSmoothies()).each(function(){
            smoothie = this
            lisays = true
            $(wantedIngredients).each(function(){
                if(!containsIngredient(smoothie.ingredients,this)){
                    lisays=false
                }
            })
            if(lisays){
                matchingSmoothies.push(smoothie)

            }


        });
        smoothiesModel.matchingSmoothies(matchingSmoothies)
    }
    getSmoothies();
    function containsIngredient(list,ingredient){
        loytyy = false;
        $(list).each(function(){
            if(this.name == ingredient){
                loytyy=true
            }
        })
        return loytyy
    }
    smoothiesModel = new smoothiesModel();
    ko.applyBindings(smoothiesModel);
    function getSmoothies(){
        $.get("/smoothies.json",function(data){
            smoothiesModel.allSmoothies(data);
            smoothiesModel.matchingSmoothies(data);
        })
    }

    $.get("/ingredients.json",function(data){
        smoothiesModel.allIngredients(data);


    })

    $("#ingredients").change(function(){
        wantedIngredients = [];
        $("#ingredients :checked").each(function(){
            wantedIngredients.push($(this).attr("name"));
        })
        smoothiesModel.wantedIngredients(wantedIngredients);
        updateMatchingSmoothies();

    })


})
$(document).on('click', '#smoothLink', function()
{
    location.href="smoothies/"+$(this).attr("link");
});
