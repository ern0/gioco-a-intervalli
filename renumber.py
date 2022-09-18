#!/usr/bin/python3 -B

import sys
import os


class Renumber:

    def main(self):

        for i in range(1,len(sys.argv)):
            self.renumber_file(sys.argv[i])

    def renumber_file(self, fnam):
        
        self.load_file(fnam)
        
        self.change_line_numbers()
        
        if self.changed:
            self.change_text()
            self.save_file(fnam)

    def load_file(self, fnam):

        self.lines = []
        self.nums = {}

        try: 
            f = open(fnam, "r")
        except Exception as e:
            print(e)
            quit()
            
        while True:

            line = f.readline()
            if not line:
                break
            line = line.strip()

            pos = line.find(" ")
            if pos > -1:
                num = line[:pos]
                if num.isnumeric():
                    inst = line[pos+1:]
                else:
                    inst = line.strip()
                    num = 0
            else:
                if line.isnumeric():
                    num = line
                    inst = ":"
                else:
                    num = 0
                    inst = line

            obj = (int(num), inst,)
            self.lines.append(obj)
            self.nums[num] = obj

        f.close()

    def save_file(self, fnam):

        tmp = fnam + ".tmp"

        f = open(tmp, "w")
        for line in self.lines:
            f.write(f"{line[0]} {line[1]}\n")
        f.close()

        os.rename(tmp, fnam)

    def change_line_numbers(self):

        self.changed = False
        self.renum = {}
        last_num = -1

        for i in range(len(self.lines)):
            (num, instr,) = self.lines[i]
 
            if num - 20 > last_num:
                last_num = num
                continue
        
            self.changed = True
            new_num = last_num + 1
            last_num = new_num
            self.renum[num] = new_num
            
            self.lines[i] = (new_num, instr,)
                        
    def change_text(self):

        for i in range(len(self.lines)):

            (num, instr,) = self.lines[i]
            instr = self.change_instr(instr)

            self.lines[i] = (num, instr,)

    def change_instr(self, instr):

        subs = instr.split(":")
        for i in range(len(subs)):
            subs[i] = self.change_ref(subs[i])
        instr = (":").join(subs)

        return instr

    def change_ref(self, sub):

        if sub.strip().startswith("rem"):
            return sub
                
        found = None
        for kw in ("then", "goto", "gosub", "restore"):
            pos = sub.find(kw)
            if pos > -1:
                found = kw
                break

        if found is None:
            return sub
        
        pos += len(found)
        left = sub[:pos]
        right = sub[pos:]
        
        if found == "then" and not right.isnumeric():
            return sub

        old_num = int(right.strip())
        if old_num in self.renum:
            new_num = self.renum[old_num]
            right = right.replace(str(old_num), str(new_num))

        sub = left + right

        return sub


if __name__ == "__main__":
    (Renumber()).main()
