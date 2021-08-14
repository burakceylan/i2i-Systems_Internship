package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {

	readFile, err := os.Open("Numbers.txt")

	if err != nil {
		log.Fatalf("failed to open file: %s", err)
		os.Exit(1)
	}

	fileScanner := bufio.NewScanner(readFile)
	fileScanner.Split(bufio.ScanLines)
	var fileTextLines []string

	for fileScanner.Scan() {
		fileTextLines = append(fileTextLines, fileScanner.Text())
	}

	readFile.Close()
	f, err := os.Create("data.txt")

	if err != nil {
		log.Fatal(err)
		os.Exit(1)
	}

	defer f.Close()

	totalSum := 0
	totalResponseCount := 0
	totalAverage := 0
	for a, eachline := range fileTextLines {
		sum := 0
		ave := 0
		for _, num := range strings.Fields(eachline) {
			i, err := strconv.Atoi(num)
			if err != nil {
				// handle error
				fmt.Println(err)
				os.Exit(2)
			}
			sum += i
			totalSum += i
		}
		totalResponseCount += len(strings.Fields(eachline))
		ave = sum / len(strings.Fields(eachline))
		if a == len(fileTextLines)-1 {
			_, err2 := f.WriteString(strconv.Itoa(ave))
			if err2 != nil {
				log.Fatal(err2)
			}
		} else {
			_, err2 := f.WriteString(strconv.Itoa(ave) + "\n")
			if err2 != nil {
				log.Fatal(err2)
			}
		}
	}
	totalAverage = totalSum / totalResponseCount
	f1, err := os.Create("data1.txt")

	if err != nil {
		log.Fatal(err)
		os.Exit(1)
	}

	defer f1.Close()
	_, err2 := f1.WriteString(strconv.Itoa(totalAverage))
	if err2 != nil {
		log.Fatal(err2)
	}

}
