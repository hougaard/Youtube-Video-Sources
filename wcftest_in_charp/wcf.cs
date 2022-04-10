using System.ServiceModel.Dispatcher;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Description;

namespace wcftest_in_charp
{
    public class AddAuthTokenClientMessageInspector : IClientMessageInspector
    {
        private string _token;

        public object BeforeSendRequest(ref Message request, IClientChannel channel)
        {
            if (request.Properties.Count == 0 || request.Properties[HttpRequestMessageProperty.Name] == null)
            {
                var property = new HttpRequestMessageProperty();
                property.Headers["Authorization"] = "bearer " + _token;
                request.Properties.Add(HttpRequestMessageProperty.Name, property);
            }
            else
            {
                ((HttpRequestMessageProperty)request.Properties[HttpRequestMessageProperty.Name]).Headers["Authorization"] = "bearer " + _token;
            }
            return null;
        }

        public void AfterReceiveReply(ref Message reply, object correlationState)
        {
        }
        public AddAuthTokenClientMessageInspector(string token)
        {
            _token = token;
        }
    }

    public class AddAuthTokenEndpointBehavior : IEndpointBehavior
    {
        public void ApplyClientBehavior(ServiceEndpoint endpoint, ClientRuntime clientRuntime)
        {
            clientRuntime.ClientMessageInspectors.Add(new AddAuthTokenClientMessageInspector(_token));
        }

        public void AddBindingParameters(ServiceEndpoint endpoint, BindingParameterCollection bindingParameters)
        {
        }

        public void ApplyDispatchBehavior(ServiceEndpoint endpoint, EndpointDispatcher endpointDispatcher)
        {
        }

        public void Validate(ServiceEndpoint endpoint)
        {
        }
        public AddAuthTokenEndpointBehavior(string token)
        {
            _token = token;
        }
        private string _token;
    }
}