class Year2015
  class Day25
    STARTER = 20_151_125
    MULT = 252_533
    MODULO = 33_554_393

    def find_iterations_count(col, row)
      (
        (
          (
            ((col + row - 1) * (col + row)) / 2
          ) - row
        ) + 1
      )
    end

    def find_answer(col, row)
      itr = find_iterations_count(col, row) - 1
      exp = MULT.pow(itr, MODULO)
      ((STARTER * exp) % MODULO)
    end

    def to_i(col, row)
      find_answer(col, row)
    end
  end
end
