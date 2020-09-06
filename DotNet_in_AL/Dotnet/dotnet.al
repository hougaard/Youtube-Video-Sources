controladdin DotNetTest
{
    MaximumHeight = 1;
    MaximumWidth = 1;
    MinimumHeight = 1;
    MinimumWidth = 1;
    HorizontalShrink = true;
    VerticalShrink = true;
    RequestedHeight = 1;
    RequestedWidth = 1;
    Scripts = 'Dotnet/_framework/blazor.webassembly.js', 'Dotnet/_framework/wasm/dotnet.3.2.0.js', 'Dotnet/script.js';
    Images = 'Dotnet/_framework/blazor.boot.json',
             'Dotnet/_framework/wasm/dotnet.wasm.png',
             'Dotnet/_framework/_bin/Microsoft.AspNetCore.Components.dll.png',
             'Dotnet/_framework/_bin/Microsoft.AspNetCore.Components.Forms.dll.png',
             'Dotnet/_framework/_bin/Microsoft.AspNetCore.Components.Web.dll.png',
             'Dotnet/_framework/_bin/Microsoft.AspNetCore.Components.WebAssembly.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Bcl.AsyncInterfaces.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.Configuration.Abstractions.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.Configuration.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.Configuration.FileExtensions.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.Configuration.Json.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.DependencyInjection.Abstractions.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.DependencyInjection.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.FileProviders.Abstractions.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.FileProviders.Physical.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.FileSystemGlobbing.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.Logging.Abstractions.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.Logging.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.Options.dll.png',
             'Dotnet/_framework/_bin/Microsoft.Extensions.Primitives.dll.png',
             'Dotnet/_framework/_bin/Microsoft.JSInterop.dll.png',
             'Dotnet/_framework/_bin/Microsoft.JSInterop.WebAssembly.dll.png',
             'Dotnet/_framework/_bin/Mono.Security.dll.png',
             'Dotnet/_framework/_bin/mscorlib.dll.png',
             'Dotnet/_framework/_bin/netstandard.dll.png',
             'Dotnet/_framework/_bin/System.Buffers.dll.png',
             'Dotnet/_framework/_bin/System.ComponentModel.Annotations.dll.png',
             'Dotnet/_framework/_bin/System.ComponentModel.Composition.dll.png',
             'Dotnet/_framework/_bin/System.ComponentModel.DataAnnotations.dll.png',
             'Dotnet/_framework/_bin/System.Core.dll.png',
             'Dotnet/_framework/_bin/System.Data.DataSetExtensions.dll.png',
             'Dotnet/_framework/_bin/System.Data.dll.png',
             'Dotnet/_framework/_bin/System.dll.png',
             'Dotnet/_framework/_bin/System.Drawing.Common.dll.png',
             'Dotnet/_framework/_bin/System.IO.Compression.dll.png',
             'Dotnet/_framework/_bin/System.IO.Compression.FileSystem.dll.png',
             'Dotnet/_framework/_bin/System.Memory.dll.png',
             'Dotnet/_framework/_bin/System.Net.Http.dll.png',
             'Dotnet/_framework/_bin/System.Net.Http.Json.dll.png',
             'Dotnet/_framework/_bin/System.Net.Http.WebAssemblyHttpHandler.dll.png',
             'Dotnet/_framework/_bin/System.Numerics.dll.png',
             'Dotnet/_framework/_bin/System.Numerics.Vectors.dll.png',
             'Dotnet/_framework/_bin/System.Runtime.CompilerServices.Unsafe.dll.png',
             'Dotnet/_framework/_bin/System.Runtime.Serialization.dll.png',
             'Dotnet/_framework/_bin/System.ServiceModel.Internals.dll.png',
             'Dotnet/_framework/_bin/System.Text.Encodings.Web.dll.png',
             'Dotnet/_framework/_bin/System.Text.Json.dll.png',
             'Dotnet/_framework/_bin/System.Threading.Tasks.Extensions.dll.png',
             'Dotnet/_framework/_bin/System.Transactions.dll.png',
             'Dotnet/_framework/_bin/System.Xml.dll.png',
             'Dotnet/_framework/_bin/System.Xml.Linq.dll.png',
             'Dotnet/_framework/_bin/TestLib.dll.png',
             'Dotnet/_framework/_bin/WebAssembly.Bindings.dll.png',
             'Dotnet/_framework/_bin/WebAssembly.Net.WebSockets.dll.png';
    StartupScript = 'Dotnet/startup.js';

    procedure Calc(a: Integer; b: Integer);
    procedure Ping();
    event ControlReady();
    event Result(d: Integer);
    event PingResult(t: Text);

}