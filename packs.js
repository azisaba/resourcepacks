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

    function createPackCard(index, fileName, description, sha1, packFormat, version) {
        let templete = $('#pack-card').html();
        let card = $(templete
            .replace(/@index/g, index)
            .replace(/@fileName/g, fileName)
            .replace(/@sha1/g, sha1)
            .replace(/@description/g, description)
            .replace(/@packFormat/g, packFormat)
            .replace(/@version/g, version)).clone()
        return card
    }

    $.getJSON("packs.json", function (json) {
        for (var i = 0; i < json.length; i++) {
            let fileName = json[i].filename
            let sha1 = json[i].sha1
            let description = json[i].description
            let packFormat = json[i].format
            let version = getPackVersion(packFormat)

            createPackCard(i, fileName, description, sha1, packFormat, version).appendTo('#packs');
        }
    });
});
