package main
import "solutions"
import "core:os"
import "core:fmt"
import "core:slice"
import "core:strconv"

main :: proc() {
	solDir, _ := os.open("solutions")
	files, _ := os.read_dir(solDir, 0)
	ct := len(files)
	if len(os.args) < 3 {
		fmt.printf(
			"Please specify the day and part that you want to run\n %s <day> <part a | b>\n",
			os.args[0],
		)
		os.exit(1)
	}
	day, _ := strconv.parse_int(os.args[1])
	part := os.args[2]
	if ct < day {
		fmt.println("Please specify a day that exists")
		os.exit(1)
	}
	if !slice.contains([]string{"a", "b"}, part) {
		fmt.println("Please specify only a or b as a part")
		os.exit(1)
	}
	switch day {
	case 1:
		solutions.one(part)
	case 2:
		solutions.two(part)
	case 3:
		solutions.three(part)
	}
}
