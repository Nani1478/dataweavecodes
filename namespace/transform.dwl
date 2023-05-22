%dw 2.0
ns naveen http://www.w3.org/2001/XMLSchema-instance // first i declared a name space at the header i have named it as naveen #ns is the kaey word for that//
output application/xml writeDeclaration = false // decleration we can enable or desable by using this tag if it is true we gae a decleration if false decleration will be removed//
---
 // requirement is to  we have 'xml'  payload with a root TAG requirement is to add a #name space for that and need to add header containing version//

{
    test @('xmlns:xsi': naveen): {
          // @ is the special character which is used to call attributes since naveen is in attributes so i used @ to call #ns//
        header: {
            version: "2.1.0"
        },
        TAG: payload.tag

    }
}
