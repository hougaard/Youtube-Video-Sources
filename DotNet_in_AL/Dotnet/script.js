function Calc(a,b)
{
    DotNet.invokeMethodAsync('TestLib', 'TestFunction',a,b)
      .then(data => {
        console.log('Calc return');
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Result',[data]);
      });
}
function Ping()
{
    console.log('Ping start');
    DotNet.invokeMethodAsync('TestLib','Ping')
    .then(data => {
        console.log('Ping return');
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('PingResult',[data]);
    })
}