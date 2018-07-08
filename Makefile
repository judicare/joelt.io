OUT = dist
STATIC_PREFIX = "https://jude.xyz/"
FOUNDATION_SRC ?= .
SRC = .

all: $(OUT) $(OUT)/index.html $(OUT)/robots.txt $(OUT)/favicon.ico $(OUT)/style.css $(OUT)/img

$(OUT):
	mkdir -p $@

$(OUT)/%: %
	cp $< $@ --no-preserve=all

$(OUT)/style.css: css/style.scss
	(echo '$$static_prefix: $(STATIC_PREFIX);'; cat $<) | sass --scss -I $(FOUNDATION_SRC)/node_modules/foundation-sites/scss -I css --sourcemap=none /dev/stdin $(OUT)/style.css

$(OUT)/img: $(wildcard img/*.png)
	mkdir -p $@
	$(foreach img,$^,optipng $(img) -out $(OUT)/img/$(notdir $(img));)

clean:
	rm -rf $(OUT)
