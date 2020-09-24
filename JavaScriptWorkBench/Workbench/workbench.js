function Execute(code)
{
    try
    {
      eval(code);
    }
    catch(e)
    {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Error',[e.toString()]);
    }
}
function showall(data)
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Error',[JSON.stringify(data,getCircularReplacer())]);
  
}
function show(data)
{
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Error',[data.toString()]);
  
}
const getCircularReplacer = () => {
  const seen = new WeakSet();
  return (key, value) => {
    if (typeof value === "object" && value !== null) {
      if (seen.has(value)) {
        return;
      }
      seen.add(value);
    }
    return value;
  };
};