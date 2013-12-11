function play(sname) {
    var audioValue = "audio/"+sname;
    embed = document.createElement("embed");
    embed.setAttribute("src", audioValue);
    embed.setAttribute("hidden", true);
    embed.setAttribute("autostart", true);
    document.body.appendChild(embed);
}