package solutions
import "core:fmt"
import "core:os"
import s "core:strings"
import "core:slice"
import "core:math"

two :: proc(part: string) {
	bytes, _ := os.read_entire_file_from_filename("data/day2.txt")
	data := string(bytes)
    plays := s.split(data, "\n")
    scores := [dynamic]int{}
	if part == "a" {
        moves := make(map[string][]string)
        moves["rock"] = []string{"A", "X"}
        moves["paper"] = []string{"B", "Y"}
        moves["scissors"] = []string{"C", "Z"}
		for play in plays {
			move := s.split(play, " ")
			items := [dynamic]string{}
			score := 0
			for m, i in move {
				if slice.contains(moves["rock"], m) {
					append(&items, "r")
					if i == 1 {
						score += 1
					}
				} else if slice.contains(moves["paper"], m) {
					append(&items, "p")
					if i == 1 {
						score += 2
					}
				} else if slice.contains(moves["scissors"], m) {
					append(&items, "s")
					if i == 1 {
						score += 3
					}
				}
			}
			if (items[0] == "r" && items[1] == "p") ||
			   (items[0] == "p" && items[1] == "s") ||
			   (items[0] == "s" && items[1] == "r") {
				score += 6
			} else if items[0] == items[1] {
				score += 3
			}
			append(&scores, score)
		}
		fmt.println(math.sum(scores[:]))
	} else {
        for play in plays {
            move := s.split(play, " ")
            items := [dynamic]string{}
            score := 0
            if move[0] == "A" {
                append(&items, "r")
            } else if move[0] == "B" {
                append(&items, "p")
            } else if move[0] == "C" {
                append(&items, "s")
            }
            if move[1] == "X" {
                if items[0] == "r" {
                    append(&items, "s")
                    score += 3
                } else if items[0] == "p" {
                    append(&items, "r")
                    score += 1
                } else {
                    append(&items, "p")
                    score += 2
                }
            } else if move[1] == "Z" {
                score += 6
                if items[0] == "r" {
                    append(&items, "p")
                    score += 2
                } else if items[0] == "p" {
                    append(&items, "s")
                    score += 3
                } else {
                    append(&items, "r")
                    score += 1
                }
            } else {
                score += 3
                if items[0] == "r" {
                    append(&items, "r")
                    score += 1
                } else if items[0] == "p" {
                    append(&items, "p")
                    score += 2
                } else {
                    append(&items, "s")
                    score += 3
                }
            }
            append(&scores, score)
        }
        fmt.println(math.sum(scores[:]))
	}
}
