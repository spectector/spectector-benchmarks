; ModuleID = '../sources/clang/05-no-unsigned.c'
source_filename = "../sources/clang/05-no-unsigned.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array1_size = dso_local global i32 16, align 4
@array1 = dso_local global [16 x i8] c"\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10", align 16
@temp = dso_local global i8 0, align 1
@array2 = common dso_local global [131072 x i8] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @victim_function_v05(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = icmp sge i64 %4, 0
  br i1 %5, label %6, label %37

; <label>:6:                                      ; preds = %1
  %7 = load i64, i64* %2, align 8
  %8 = load i32, i32* @array1_size, align 4
  %9 = zext i32 %8 to i64
  %10 = icmp slt i64 %7, %9
  br i1 %10, label %11, label %37

; <label>:11:                                     ; preds = %6
  %12 = load i64, i64* %2, align 8
  %13 = sub nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  store i32 %14, i32* %3, align 4
  br label %15

; <label>:15:                                     ; preds = %33, %11
  %16 = load i32, i32* %3, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %36

; <label>:18:                                     ; preds = %15
  %19 = load i32, i32* %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %20
  %22 = load i8, i8* %21, align 1
  %23 = zext i8 %22 to i32
  %24 = mul nsw i32 %23, 512
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = load i8, i8* @temp, align 1
  %30 = zext i8 %29 to i32
  %31 = and i32 %30, %28
  %32 = trunc i32 %31 to i8
  store i8 %32, i8* @temp, align 1
  br label %33

; <label>:33:                                     ; preds = %18
  %34 = load i32, i32* %3, align 4
  %35 = add nsw i32 %34, -1
  store i32 %35, i32* %3, align 4
  br label %15

; <label>:36:                                     ; preds = %15
  br label %37

; <label>:37:                                     ; preds = %36, %6, %1
  ret void
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
