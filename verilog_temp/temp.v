assign equal[0] = buf_id_vld[0] && (rpt_res_val0 == rpt_id);
assign equal[1] = buf_id_vld[1] && (rpt_res_val1 == rpt_id);
assign equal[2] = buf_id_vld[2] && (rpt_res_val2 == rpt_id);
assign equal[3] = buf_id_vld[3] && (rpt_res_val3 == rpt_id);
assign equal[4] = buf_id_vld[4] && (rpt_res_val4 == rpt_id);
assign equal[5] = buf_id_vld[5] && (rpt_res_val5 == rpt_id);
assign equal[6] = buf_id_vld[6] && (rpt_res_val6 == rpt_id);
assign equal[7] = buf_id_vld[7] && (rpt_res_val7 == rpt_id);

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		rpt_res_val <= 6'd0;
		buf_id_vld <= 8'd0;
		buf_id <= 3'd0;
	end
	else if(clear)begin
		if(equal[0])begin
			buf_id_vld[0] <= 1'b0;
		end
		else if(equal[1])begin
			buf_id_vld[1] <= 1'b0;
		end
		else if(equal[2])begin
			buf_id_vld[2] <= 1'b0;
		end
		else if(equal[3])begin
			buf_id_vld[3] <= 1'b0;
		end
		else if(equal[4])begin
			buf_id_vld[4] <= 1'b0;
		end
		else if(equal[5])begin
			buf_id_vld[5] <= 1'b0;
		end
		else if(equal[6])begin
			buf_id_vld[6] <= 1'b0;
		end
		else if(equal[7])begin
			buf_id_vld[7] <= 1'b0;
		end
	end
	else if(pre_start)begin
		if(!buf_id_vld[0])begin
			rtp_res_val0 <= {pre_rpt_id, pre_res_id};
			buf_id <= 3'd0;
			buf_id_vld[0] <= 1'b1;
		end
		else if(buf_id_vld[1])begin
			rtp_res_val1 <= {pre_rpt_id, pre_res_id};
			buf_id <= 3'd1;
			buf_id_vld[1] <= 1'b1;
		end
		else if(buf_id_vld[2])begin
			rtp_res_val2 <= {pre_rpt_id, pre_res_id};
			buf_id <= 3'd2;
			buf_id_vld[2] <= 1'b1;
		end
		else if(buf_id_vld[3])begin
			rtp_res_val3 <= {pre_rpt_id, pre_res_id};
			buf_id <= 3'd3;
			buf_id_vld[3] <= 1'b1;
		end
		else if(buf_id_vld[4])begin
			rtp_res_val4 <= {pre_rpt_id, pre_res_id};
			buf_id <= 3'd4;
			buf_id_vld[4] <= 1'b1;
		end
		else if(buf_id_vld[5])begin
			rtp_res_val5 <= {pre_rpt_id, pre_res_id};
			buf_id <= 3'd5;
			buf_id_vld[5] <= 1'b1;
		end
		else if(buf_id_vld[6])begin
			rtp_res_val6 <= {pre_rpt_id, pre_res_id};
			buf_id <= 3'd6;
			buf_id_vld[6] <= 1'b1;
		end
		else if(buf_id_vld[1])begin
			rtp_res_val7 <= {pre_rpt_id, pre_res_id};
			buf_id <= 3'd7;
			buf_id_vld[7] <= 1'b1;
		end
	end
end

