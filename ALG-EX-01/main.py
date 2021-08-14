# This is a sample Python script.

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.


def findRepeat(numbers):
    repeat_nums = list()
    for i in numbers:
        if numbers.count(i) > 1:
            repeat_nums.append(i)
            numbers.remove(i)

    return repeat_nums


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    nestedList = [[1, 2, 4, 8, 3], [4,6,12,5,5,89], [4, 3, 8, 8, 35, 35, 12], [5, 6, 78, 5]]
    for i in nestedList:
        repeats = findRepeat(i)
        if len(repeats) == 0:
            print("YOK")
        else:
            print(repeats)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
