class Utils {

    constructor() {
        if (!Utils._instance) {
            Utils._instance = this;
        } else {
            return Utils._instance;
        }
    }

    getAbsoluteElementSizes(el) {
        var styles = window.getComputedStyle(el);
        var sizesHeigth = {
            absoluteHeight: 0,
            heigth: el.offsetHeight,
            margins: this.getFloatSumPx(styles.marginTop, styles.marginBottom),
            paddings: this.getFloatSumPx(styles.paddingTop, styles.paddingBottom),
            borders: this.getFloatSumPx(styles.borderTopWidth, styles.borderBottomWidth),
        };

        var sizesWidth = {
            absoluteWidth: 0,
            width: el.offsetWidth,
            margins: this.getFloatSumPx(styles.marginLeft, styles.marginRight),
            paddings: this.getFloatSumPx(styles.paddingLeft, styles.paddingRight),
            borders: this.getFloatSumPx(styles.borderLeftWidth, styles.borderRightWidth),
        }

        var absoluteHeight = this.getFloatSumPx(Object.values(sizesHeigth));
        var absoluteWidth = this.getFloatSumPx(Object.values(sizesWidth));

        sizes.absoluteHeight = absoluteHeight;
        sizes.absoluteWidth = absoluteWidth;
        return {
            absoluteHeight,
            absoluteWidth,
            details: [
                sizesHeigth, sizesWidth
            ],
        };
    }


    uploadMultipleFilesFromHtml(url, formData, input) {
        for (let i = 0; i < input.files.length; i++) {
            formData.append('File', input[i]);
        }
        fetch(url, {
            method: 'POST',
            body: formData
        }).then(response => response.json()).then(result => {
            console.log("Sucess uploaded: ", result);
        }
        ).catch(error => {
            console.error("Error: ", error);
        }
        );
    }

    static getInstance() {
        var instance;
        if (Utils.constructor) {
            instance = new Utils();
            delete instance.constructor;
        }
        return instance;
    }

    getFloatSumPx(...sizes) {
        var totalSize = 0;

        sizes.forEach(size => {
            totalSize += parseFloat(size);
        }
        );

        return totalSize;
    }
}
