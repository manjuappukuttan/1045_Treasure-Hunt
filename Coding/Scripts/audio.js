
   function play() {
        var audioValue = "audio/pirates.mp3";

        embed = document.createElement("embed");
        embed.setAttribute("src", audioValue);
        embed.setAttribute("hidden", true);
        embed.setAttribute("autostart", true);
        document.body.appendChild(embed);
    }
    window.onload = function () {
        play();
    }
