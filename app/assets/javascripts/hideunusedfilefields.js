$(document).ready(function() {
    var unusedfilefield = new Array;
    for (var i=0;i<$(".newfilefield").length;i++)
    {
        if($(".newfilefield")[i].children[0].files.length==0)
        {
            unusedfilefield.push($(".newfilefield")[i]);
        }
    }

    $(unusedfilefield).hide(0);
    $(unusedfilefield[0]).show(0);

    for(var i=0;i<$(".newfilefield").length;i++)
    {
        $(".newfilefield")[i].children[0].onchange=function()
        {
            unusedfilefield = new Array;
            for (var i=0;i<$(".newfilefield").length;i++){
                if($(".newfilefield")[i].children[0].files.length==0){
                    unusedfilefield.push($(".newfilefield")[i]);
                }
            }
            $(unusedfilefield).hide(0);
            $(unusedfilefield[0]).show(0);
        }
    }
});