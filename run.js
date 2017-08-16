var page = require('webpage').create(),
    system = require('system'),
    address;

if (system.args.length === 1) {
    console.log('Usage: netlog.js <some URL>');
    phantom.exit(1);
} else {
    address = system.args[1];

    page.onResourceRequested = function (req) {
        //console.log('requested: ' + JSON.stringify(req, undefined, 4));
        //console.log(req['url']);
        var url = req['url'];
        var pos = url.indexOf('flv');
        if(pos === -1)
            return;
        pos = url.indexOf('wsiphost');
        if(pos === -1)
            return;
        console.log(url);
        phantom.exit();
    };

    page.onResourceReceived = function (res) {
        //console.log('received: ' + JSON.stringify(res, undefined, 4));
        //console.log(res['redirectURL']);
    };

    page.open(address, function (status) {
        if (status !== 'success') {
            console.log('FAIL to load the address');
        }
        //phantom.exit();
    });
    //page.open(address);
}
