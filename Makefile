OUT = dist
STATIC_PREFIX = "https://jude.xyz/"
FOUNDATION_SRC ?= .
SRC = .

ARTIFACTS := $(addprefix $(OUT)/,index.html robots.txt favicon.ico style.css $(wildcard img/*))

all: $(ARTIFACTS)

$(OUT)/%: %
	install $< $@

$(OUT)/%.css: css/%.scss
	(echo '$$static_prefix: $(STATIC_PREFIX);'; cat $<) \
		| sass --scss -I $(FOUNDATION_SRC)/node_modules/foundation-sites/scss -I css \
			--sourcemap=none /dev/stdin $@

$(OUT)/img/%.png: img/%.png
	optipng $^ -o7 -out $@

$(ARTIFACTS): | $(OUT)

$(OUT):
	mkdir -p $@ $@/img

.PHONY: clean

clean:
	rm -rf $(OUT)
