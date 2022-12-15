package solutions
import "core:fmt"
import "core:os"
import s "core:strings"
import "core:slice"
import "core:math"

Split :: struct {
	start, end: string,
}

three :: proc(part: string) {
	bytes, _ := os.read_entire_file_from_filename("data/day3.txt")
	data := string(bytes)
	sacks := s.split(data, "\n")
	if part == "a" {
		p := [dynamic]int{}
		for sack in sacks {
			h := half(sack)
			i := intersect(h.start, h.end)
			append(&p, priority(i))
		}
		sum: int = 0
		for x in p do sum += x
		fmt.println(sum)
	} else {
		p := [dynamic]int{}
		triples := threes(sacks)
		for t in triples {
			i := three_intersect(t)
			x := priority(i)
			append(&p, x)
		}
		s: int = 0
		for x in p do s += x
		fmt.println(s)
	}
}

half :: proc(text: string) -> Split {
	idx := len(text) / 2
	return Split{text[:idx], text[idx:]}
}

priority :: proc(r: rune) -> int {
	if int(r) > 96 {
		return int(r) - 96
	} else {
		return int(r) - 38
	}
}

intersect :: proc(s1, s2: string) -> rune {
	for x in s1 {
		for y in s2 {
			if x == y {
				return x
			}
		}
	}
	return ' '
}

threes :: proc(array: []string) -> [dynamic][]string {
	res := [dynamic][]string{}
	btm := 0
	for i in 0..=len(array) {
		if i % 3 == 0 && i >= 3 {
			append(&res, array[btm:i])
			btm = i 
		}
	}
	return res
}

three_intersect :: proc(s: []string) -> rune {
	for x in s[0] {
		for y in s[1] {
			for z in s[2] {
				if x == y && y == z {
					return x
				}
			}
		}
	}
	return ' '
}