$(document).ready(function(){
    link = $("#imgurlink").attr("href");
    console.log(link)
    splittedLink = link.split(".");
    mediumSizeLink = splittedLink[0]+"."+splittedLink[1]+"."+splittedLink[2]+"m.jpg";
    $("#prv-image").attr("src",mediumSizeLink);
});


