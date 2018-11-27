const request={
    request(options,successFunction,errorFunction){
        var vue=new Vue();
        if(options.method==null)
            options.method="post";
        if(options.data!=null){
            //var ajaxRequest=new Object();
			//ajaxRequest.map=options.body;
			options.data = JSON.stringify(options.data);
        }
        // options.headers={
        //     "Content-Type":"application/json",
        //     "Access-Control-Allow-Origin":"*"
        // }
        // options.crossOrigin=true;
        // options.responseType="json"
        vue.$http.post(options.url,options.data,options).then(
            function(response) {
            // 响应成功回调
            successFunction(response)
        }, function (response)  {
            // 响应错误回调
            errorFunction(response)
        });
    }
}

export default request;