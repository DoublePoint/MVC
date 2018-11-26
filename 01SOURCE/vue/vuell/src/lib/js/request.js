const request={
    request(options){
        var vue=new Vue();
        var url=options.url;
        console.log(vue.$http)
    }
}

export default request;