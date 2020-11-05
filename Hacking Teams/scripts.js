function Render(html)
{
    HTMLContainer.insertAdjacentHTML('beforeend',html);
}
function AddTeams()
{
    var topbar = window.top.document.getElementById('centerRegion');
    console.log(topbar);

    topbar.insertAdjacentHTML('afterbegin',
    '<div><button onclick="window.open(\'https://teams.microsoft.com/share?href=\'+ '+
    'encodeURIComponent(window.top.location.href)' +
    ',\'teamsshare\',\'width=700,height=600\')">Team</button></div>');
}