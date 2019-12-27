c> @defgroup core The Nek5000 core library
c>
c> @{
c
c> @brief *Drives* the solver calling 3 subroutines:
c> - nek_init()
c> - nek_solve()
c> - nek_end()
c> - exitt0()
      program NEKTON
c
      call nek_init(intracomm)
      call nek_solve()
      call nek_end()

      call exitt0()

      end
c> @}
c end of group core
