all:
	cargo build --release

run:
	cargo run --release

diff:
	cargo run --release > Colleen_kid.rs
	diff src/main.rs Colleen_kid.rs

clean:
	cargo clean
	rm -f Colleen_kid.rs

.PHONY: all clean