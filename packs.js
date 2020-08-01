$(function () {
    function getPackVersion(packFormat) {
        switch (packFormat) {
            case 1:
                return "1.6.1–1.8.9";
            case 2:
                return "1.9–1.10.2";
            case 3:
                return "1.11–1.12.2";
            case 4:
                return "1.13–1.14.4";
            case 5:
                return "1.15–1.16.1";
        }
    }

    function createPackCard(fileName, description, sha1, packFormat, version) {
        return $('<div class="container py-2"><div class="row"><div class="card w-100"><div class="card-body"><h5 class="card-title">' + fileName + '</h5><p class="card-text">' + description + '</p><ul class="list-group list-group-flush"><li class="list-group-item">SHA1: ' + sha1 + '</li><li class="list-group-item">対応バージョン: ' + version + ' (' + packFormat + ')</li></ul><a href="' + fileName + '" class="btn btn-primary float-right">ダウンロード</a></div></div></div></div>')
    }

    $.getJSON("packs.json", function (json) {
        for (var i = 0; i < json.length; i++) {
            let fileName = json[i].filename
            let sha1 = json[i].sha1
            let description = json[i].description
            let packFormat = json[i].format
            let version = getPackVersion(packFormat)

            createPackCard(fileName, description, sha1, packFormat, version).appendTo('#packs');
        }
    });
});
