; ModuleID = '../sources/clang/07.c'
source_filename = "../sources/clang/07.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array1_size = dso_local global i32 16, align 4
@array1 = dso_local global [16 x i8] c"\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10", align 16
@temp = dso_local global i8 0, align 1
@victim_function_v07.last_x = internal global i64 0, align 8
@array2 = common dso_local global [131072 x i8] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @victim_function_v07(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = load i64, i64* @victim_function_v07.last_x, align 8
  %5 = icmp eq i64 %3, %4
  br i1 %5, label %6, label %20

; <label>:6:                                      ; preds = %1
  %7 = load i64, i64* %2, align 8
  %8 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %7
  %9 = load i8, i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = mul nsw i32 %10, 512
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %12
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = load i8, i8* @temp, align 1
  %17 = zext i8 %16 to i32
  %18 = and i32 %17, %15
  %19 = trunc i32 %18 to i8
  store i8 %19, i8* @temp, align 1
  br label %20

; <label>:20:                                     ; preds = %6, %1
  %21 = load i64, i64* %2, align 8
  %22 = load i32, i32* @array1_size, align 4
  %23 = zext i32 %22 to i64
  %24 = icmp ult i64 %21, %23
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %20
  %26 = load i64, i64* %2, align 8
  store i64 %26, i64* @victim_function_v07.last_x, align 8
  br label %27

; <label>:27:                                     ; preds = %25, %20
  ret void
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
