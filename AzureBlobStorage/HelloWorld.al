// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        response: Codeunit "ABS Operation Response";
        containers: Record "ABS Container";
        content: Record "ABS Container Content";
        Txt: Text;
    begin
        Authorization := StorageServiceAuthorization.CreateSharedKey('uKox8/1MnfUXZgjIBggIe9DCVK4zmTXawt4O2vvwFYdJ+19+TDUmvopnA+70x8M0JhLl/8rFk/w3+AStpCrPag==');
        ContainerClient.Initialize('erikyoutube', Authorization);
        response := ContainerClient.CreateContainer('youtube');
        response := ContainerClient.ListContainers(containers);
        if response.IsSuccessful() then begin
            if containers.findset() then
                repeat
                    message('%1', containers.Name);
                until containers.next() = 0;
        end else
            message('ABS Error: %1', response.GetError());

        BlobClient.Initialize('erikyoutube', 'youtube', Authorization);
        response := BlobClient.PutBlobBlockBlobText('BCBlob2', 'This is the content of our blobloblob');
        if not Response.IsSuccessful() then
            message('PutBlobBlobBlob %1', response.GetError());

        response := BlobClient.ListBlobs(content);
        if response.IsSuccessful() then
            if content.findset() then
                repeat
                    message('%1', content.Name);
                    BlobClient.GetBlobAsText(content.Name, Txt);
                    Message('%1', Txt);
                until content.next() = 0;
    end;

    var
        ContainerClient: Codeunit "ABS Container Client";
        BlobClient: Codeunit "ABS Blob Client";
        StorageServiceAuthorization: Codeunit "Storage Service Authorization";
        Authorization: Interface "Storage Service Authorization";

}