package solutions
import "core:fmt"
import "core:os"
import "core:strconv"
import "core:slice"
import s "core:strings"

one :: proc(part: string) {
    bytes, _ := os.read_entire_file_from_filename("data/day1.txt")
    data := string(bytes)
	if part == "a" {
		elves := s.split(data, "\n\n")
		calories := [dynamic]int{}
		for elf in elves {
			cals := 0
			for snack in s.split(elf, "\n") {
				kc, _ := strconv.parse_int(snack)
				cals += kc
			}
			append(&calories, cals)
		}
		fmt.println(slice.max(calories[:]))
	} else {
		elves := s.split(data, "\n\n")
		calories := [dynamic]int{}
		for elf in elves {
			cals := 0
			for snack in s.split(elf, "\n") {
				kc, _ := strconv.parse_int(snack)
				cals += kc
			}
			append(&calories, cals)
		}
        slice.sort(calories[:])
        l := len(calories) - 1
		fmt.println(calories[l] + calories[l-1] + calories[l-2])
	}
}
