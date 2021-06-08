<script>
    vesselBox = document.querySelector("#vesselBox");
    vessels = document.querySelector("#vessels");
    var when = "keyup"; //You can change this to keydown, keypress or change

    vesselBox.addEventListener("keyup", function (e) {
        var text = e.target.value; 
        var options = vessels.options; 
        for (var i = 0; i < options.length; i++) {
            var option = options[i]; 
            var optionText = option.text; 
            var lowerOptionText = optionText.toLowerCase();
            var lowerText = text.toLowerCase(); 
            var regex = new RegExp("^" + text, "i");
            var match = optionText.match(regex); 
            var contains = lowerOptionText.indexOf(lowerText) != -1;
            if (match || contains) {
                option.selected = true;
                return;
            }
            vesselBox.selectedIndex = 0;
        }
    });

    console.log("hi");

    function mySwitch() {
    var x = document.getElementById("demo");
    if (x.value === "1") {
        x.value = "0";
    } else {
        x.value = "1";
        
    }
    console.log(x.value);
    }
                   

</script> 