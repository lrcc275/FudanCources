export HOME = $(shell pwd)
export OUTPUT_DIR = $(HOME)/build

.PHONY: clean all $(OUTPUT_DIR)

all: $(OUTPUT_DIR)
ifeq ($(PART),)
	echo hello world
else
	make -j -C $(OUTPUT_DIR) -f $(HOME)/mk/part$(PART).mk
endif

$(OUTPUT_DIR):
	mkdir $(OUTPUT_DIR) || true

clean:
	rm -rf $(OUTPUT_DIR)
