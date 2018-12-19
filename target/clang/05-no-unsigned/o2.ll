; ModuleID = '../sources/clang/05-no-unsigned.c'
source_filename = "../sources/clang/05-no-unsigned.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array1_size = dso_local local_unnamed_addr global i32 16, align 4
@array1 = dso_local local_unnamed_addr global [16 x i8] c"\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10", align 16
@temp = dso_local local_unnamed_addr global i8 0, align 1
@array2 = common dso_local local_unnamed_addr global [131072 x i8] zeroinitializer, align 16

; Function Attrs: norecurse nounwind sspstrong uwtable
define dso_local void @victim_function_v05(i64) local_unnamed_addr #0 {
  %2 = icmp sgt i64 %0, -1
  br i1 %2, label %3, label %78

; <label>:3:                                      ; preds = %1
  %4 = load i32, i32* @array1_size, align 4, !tbaa !4
  %5 = zext i32 %4 to i64
  %6 = icmp sgt i64 %5, %0
  br i1 %6, label %7, label %78

; <label>:7:                                      ; preds = %3
  %8 = trunc i64 %0 to i32
  %9 = add i32 %8, -1
  %10 = icmp sgt i32 %9, -1
  br i1 %10, label %11, label %78

; <label>:11:                                     ; preds = %7
  %12 = load i8, i8* @temp, align 1, !tbaa !8
  %13 = sext i32 %9 to i64
  %14 = and i32 %8, 3
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %32, label %16

; <label>:16:                                     ; preds = %11, %16
  %17 = phi i64 [ %29, %16 ], [ %13, %11 ]
  %18 = phi i8 [ %27, %16 ], [ %12, %11 ]
  %19 = phi i32 [ %28, %16 ], [ %9, %11 ]
  %20 = phi i32 [ %30, %16 ], [ %14, %11 ]
  %21 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %17
  %22 = load i8, i8* %21, align 1, !tbaa !8
  %23 = zext i8 %22 to i64
  %24 = shl nuw nsw i64 %23, 9
  %25 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %24
  %26 = load i8, i8* %25, align 16, !tbaa !8
  %27 = and i8 %18, %26
  %28 = add i32 %19, -1
  %29 = add nsw i64 %17, -1
  %30 = add i32 %20, -1
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %16, !llvm.loop !9

; <label>:32:                                     ; preds = %16, %11
  %33 = phi i64 [ %13, %11 ], [ %29, %16 ]
  %34 = phi i8 [ %12, %11 ], [ %27, %16 ]
  %35 = phi i32 [ %9, %11 ], [ %28, %16 ]
  %36 = phi i8 [ undef, %11 ], [ %27, %16 ]
  %37 = icmp ult i32 %9, 3
  br i1 %37, label %76, label %38

; <label>:38:                                     ; preds = %32, %38
  %39 = phi i64 [ %75, %38 ], [ %33, %32 ]
  %40 = phi i8 [ %72, %38 ], [ %34, %32 ]
  %41 = phi i32 [ %73, %38 ], [ %35, %32 ]
  %42 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %39
  %43 = load i8, i8* %42, align 1, !tbaa !8
  %44 = zext i8 %43 to i64
  %45 = shl nuw nsw i64 %44, 9
  %46 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %45
  %47 = load i8, i8* %46, align 16, !tbaa !8
  %48 = and i8 %40, %47
  %49 = add nsw i64 %39, -1
  %50 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %49
  %51 = load i8, i8* %50, align 1, !tbaa !8
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 9
  %54 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %53
  %55 = load i8, i8* %54, align 16, !tbaa !8
  %56 = and i8 %48, %55
  %57 = add nsw i64 %39, -2
  %58 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %57
  %59 = load i8, i8* %58, align 1, !tbaa !8
  %60 = zext i8 %59 to i64
  %61 = shl nuw nsw i64 %60, 9
  %62 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %61
  %63 = load i8, i8* %62, align 16, !tbaa !8
  %64 = and i8 %56, %63
  %65 = add nsw i64 %39, -3
  %66 = getelementptr inbounds [16 x i8], [16 x i8]* @array1, i64 0, i64 %65
  %67 = load i8, i8* %66, align 1, !tbaa !8
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 9
  %70 = getelementptr inbounds [131072 x i8], [131072 x i8]* @array2, i64 0, i64 %69
  %71 = load i8, i8* %70, align 16, !tbaa !8
  %72 = and i8 %64, %71
  %73 = add i32 %41, -4
  %74 = icmp sgt i32 %73, -1
  %75 = add nsw i64 %39, -4
  br i1 %74, label %38, label %76

; <label>:76:                                     ; preds = %38, %32
  %77 = phi i8 [ %36, %32 ], [ %72, %38 ]
  store i8 %77, i8* @temp, align 1, !tbaa !8
  br label %78

; <label>:78:                                     ; preds = %7, %76, %3, %1
  ret void
}

attributes #0 = { norecurse nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
